# Explore: explore_2344
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07033.view.lkml"
include: "/views/domain_35/view_07035.view.lkml"
include: "/views/domain_36/view_07036.view.lkml"
include: "/views/domain_37/view_07037.view.lkml"

explore: explore_2344 {
  label: "Explore Explore 2344"
  description: "Comprehensive analytics explore joining base view_07033 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07033
  
  always_filter: {
    filters: [view_07033.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07033.created_at_date: "7 days"]
    unless: [view_07033.id, view_07033.status]
  }

  join: view_07035 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07033.user_id} = ${view_07035.id} ;;
    required_joins: []
  }

  join: view_07036 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07033.account_id} = ${view_07036.account_id} ;;
    required_joins: [view_07035]
  }

  join: view_07037 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07033.category} = ${view_07037.category} ;;
  }

  access_filter: {
    field: view_07033.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07033.is_deleted} = false ;;
}
