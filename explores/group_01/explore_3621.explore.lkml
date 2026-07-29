# Explore: explore_3621
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10864.view.lkml"
include: "/views/domain_16/view_10866.view.lkml"
include: "/views/domain_17/view_10867.view.lkml"
include: "/views/domain_18/view_10868.view.lkml"

explore: explore_3621 {
  label: "Explore Explore 3621"
  description: "Comprehensive analytics explore joining base view_10864 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10864
  
  always_filter: {
    filters: [view_10864.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10864.created_at_date: "7 days"]
    unless: [view_10864.id, view_10864.status]
  }

  join: view_10866 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10864.user_id} = ${view_10866.id} ;;
    required_joins: []
  }

  join: view_10867 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10864.account_id} = ${view_10867.account_id} ;;
    required_joins: [view_10866]
  }

  join: view_10868 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10864.category} = ${view_10868.category} ;;
  }

  access_filter: {
    field: view_10864.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10864.is_deleted} = false ;;
}
