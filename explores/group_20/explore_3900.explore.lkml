# Explore: explore_3900
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11701.view.lkml"
include: "/views/domain_03/view_11703.view.lkml"
include: "/views/domain_04/view_11704.view.lkml"
include: "/views/domain_05/view_11705.view.lkml"

explore: explore_3900 {
  label: "Explore Explore 3900"
  description: "Comprehensive analytics explore joining base view_11701 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11701
  
  always_filter: {
    filters: [view_11701.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11701.created_at_date: "7 days"]
    unless: [view_11701.id, view_11701.status]
  }

  join: view_11703 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11701.user_id} = ${view_11703.id} ;;
    required_joins: []
  }

  join: view_11704 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11701.account_id} = ${view_11704.account_id} ;;
    required_joins: [view_11703]
  }

  join: view_11705 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11701.category} = ${view_11705.category} ;;
  }

  access_filter: {
    field: view_11701.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11701.is_deleted} = false ;;
}
