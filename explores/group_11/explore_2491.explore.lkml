# Explore: explore_2491
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07474.view.lkml"
include: "/views/domain_26/view_07476.view.lkml"
include: "/views/domain_27/view_07477.view.lkml"
include: "/views/domain_28/view_07478.view.lkml"

explore: explore_2491 {
  label: "Explore Explore 2491"
  description: "Comprehensive analytics explore joining base view_07474 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07474
  
  always_filter: {
    filters: [view_07474.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07474.created_at_date: "7 days"]
    unless: [view_07474.id, view_07474.status]
  }

  join: view_07476 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07474.user_id} = ${view_07476.id} ;;
    required_joins: []
  }

  join: view_07477 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07474.account_id} = ${view_07477.account_id} ;;
    required_joins: [view_07476]
  }

  join: view_07478 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07474.category} = ${view_07478.category} ;;
  }

  access_filter: {
    field: view_07474.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07474.is_deleted} = false ;;
}
