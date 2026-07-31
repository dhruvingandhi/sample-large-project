# Update for 2000 file diff target
# Explore: explore_1939
# Auto-generated LookML Explore File

include: "/views/domain_18/view_05818.view.lkml"
include: "/views/domain_20/view_05820.view.lkml"
include: "/views/domain_21/view_05821.view.lkml"
include: "/views/domain_22/view_05822.view.lkml"

explore: explore_1939 {
  label: "Explore Explore 1939"
  description: "Comprehensive analytics explore joining base view_05818 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05818
  
  always_filter: {
    filters: [view_05818.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05818.created_at_date: "7 days"]
    unless: [view_05818.id, view_05818.status]
  }

  join: view_05820 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05818.user_id} = ${view_05820.id} ;;
    required_joins: []
  }

  join: view_05821 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05818.account_id} = ${view_05821.account_id} ;;
    required_joins: [view_05820]
  }

  join: view_05822 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05818.category} = ${view_05822.category} ;;
  }

  access_filter: {
    field: view_05818.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05818.is_deleted} = false ;;
}
