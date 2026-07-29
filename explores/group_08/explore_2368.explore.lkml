# Explore: explore_2368
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07105.view.lkml"
include: "/views/domain_07/view_07107.view.lkml"
include: "/views/domain_08/view_07108.view.lkml"
include: "/views/domain_09/view_07109.view.lkml"

explore: explore_2368 {
  label: "Explore Explore 2368"
  description: "Comprehensive analytics explore joining base view_07105 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07105
  
  always_filter: {
    filters: [view_07105.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07105.created_at_date: "7 days"]
    unless: [view_07105.id, view_07105.status]
  }

  join: view_07107 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07105.user_id} = ${view_07107.id} ;;
    required_joins: []
  }

  join: view_07108 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07105.account_id} = ${view_07108.account_id} ;;
    required_joins: [view_07107]
  }

  join: view_07109 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07105.category} = ${view_07109.category} ;;
  }

  access_filter: {
    field: view_07105.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07105.is_deleted} = false ;;
}
