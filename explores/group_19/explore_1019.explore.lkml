# Update for 2000 file diff target
# Explore: explore_1019
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03058.view.lkml"
include: "/views/domain_10/view_03060.view.lkml"
include: "/views/domain_11/view_03061.view.lkml"
include: "/views/domain_12/view_03062.view.lkml"

explore: explore_1019 {
  label: "Explore Explore 1019"
  description: "Comprehensive analytics explore joining base view_03058 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03058
  
  always_filter: {
    filters: [view_03058.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03058.created_at_date: "7 days"]
    unless: [view_03058.id, view_03058.status]
  }

  join: view_03060 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03058.user_id} = ${view_03060.id} ;;
    required_joins: []
  }

  join: view_03061 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03058.account_id} = ${view_03061.account_id} ;;
    required_joins: [view_03060]
  }

  join: view_03062 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03058.category} = ${view_03062.category} ;;
  }

  access_filter: {
    field: view_03058.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03058.is_deleted} = false ;;
}
