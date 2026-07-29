# Explore: explore_1856
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05569.view.lkml"
include: "/views/domain_21/view_05571.view.lkml"
include: "/views/domain_22/view_05572.view.lkml"
include: "/views/domain_23/view_05573.view.lkml"

explore: explore_1856 {
  label: "Explore Explore 1856"
  description: "Comprehensive analytics explore joining base view_05569 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05569
  
  always_filter: {
    filters: [view_05569.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05569.created_at_date: "7 days"]
    unless: [view_05569.id, view_05569.status]
  }

  join: view_05571 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05569.user_id} = ${view_05571.id} ;;
    required_joins: []
  }

  join: view_05572 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05569.account_id} = ${view_05572.account_id} ;;
    required_joins: [view_05571]
  }

  join: view_05573 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05569.category} = ${view_05573.category} ;;
  }

  access_filter: {
    field: view_05569.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05569.is_deleted} = false ;;
}
