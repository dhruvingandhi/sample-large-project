# Explore: explore_1368
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04105.view.lkml"
include: "/views/domain_07/view_04107.view.lkml"
include: "/views/domain_08/view_04108.view.lkml"
include: "/views/domain_09/view_04109.view.lkml"

explore: explore_1368 {
  label: "Explore Explore 1368"
  description: "Comprehensive analytics explore joining base view_04105 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04105
  
  always_filter: {
    filters: [view_04105.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04105.created_at_date: "7 days"]
    unless: [view_04105.id, view_04105.status]
  }

  join: view_04107 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04105.user_id} = ${view_04107.id} ;;
    required_joins: []
  }

  join: view_04108 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04105.account_id} = ${view_04108.account_id} ;;
    required_joins: [view_04107]
  }

  join: view_04109 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04105.category} = ${view_04109.category} ;;
  }

  access_filter: {
    field: view_04105.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04105.is_deleted} = false ;;
}
