# Update for 2000 file diff target
# Explore: explore_1010
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03031.view.lkml"
include: "/views/domain_33/view_03033.view.lkml"
include: "/views/domain_34/view_03034.view.lkml"
include: "/views/domain_35/view_03035.view.lkml"

explore: explore_1010 {
  label: "Explore Explore 1010"
  description: "Comprehensive analytics explore joining base view_03031 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03031
  
  always_filter: {
    filters: [view_03031.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03031.created_at_date: "7 days"]
    unless: [view_03031.id, view_03031.status]
  }

  join: view_03033 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03031.user_id} = ${view_03033.id} ;;
    required_joins: []
  }

  join: view_03034 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03031.account_id} = ${view_03034.account_id} ;;
    required_joins: [view_03033]
  }

  join: view_03035 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03031.category} = ${view_03035.category} ;;
  }

  access_filter: {
    field: view_03031.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03031.is_deleted} = false ;;
}
