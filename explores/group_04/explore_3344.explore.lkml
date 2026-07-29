# Explore: explore_3344
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10033.view.lkml"
include: "/views/domain_35/view_10035.view.lkml"
include: "/views/domain_36/view_10036.view.lkml"
include: "/views/domain_37/view_10037.view.lkml"

explore: explore_3344 {
  label: "Explore Explore 3344"
  description: "Comprehensive analytics explore joining base view_10033 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10033
  
  always_filter: {
    filters: [view_10033.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10033.created_at_date: "7 days"]
    unless: [view_10033.id, view_10033.status]
  }

  join: view_10035 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10033.user_id} = ${view_10035.id} ;;
    required_joins: []
  }

  join: view_10036 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10033.account_id} = ${view_10036.account_id} ;;
    required_joins: [view_10035]
  }

  join: view_10037 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10033.category} = ${view_10037.category} ;;
  }

  access_filter: {
    field: view_10033.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10033.is_deleted} = false ;;
}
