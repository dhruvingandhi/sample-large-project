# Update for 2000 file diff target
# Explore: explore_0430
# Auto-generated LookML Explore File

include: "/views/domain_41/view_01291.view.lkml"
include: "/views/domain_43/view_01293.view.lkml"
include: "/views/domain_44/view_01294.view.lkml"
include: "/views/domain_45/view_01295.view.lkml"

explore: explore_0430 {
  label: "Explore Explore 0430"
  description: "Comprehensive analytics explore joining base view_01291 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01291
  
  always_filter: {
    filters: [view_01291.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01291.created_at_date: "7 days"]
    unless: [view_01291.id, view_01291.status]
  }

  join: view_01293 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01291.user_id} = ${view_01293.id} ;;
    required_joins: []
  }

  join: view_01294 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01291.account_id} = ${view_01294.account_id} ;;
    required_joins: [view_01293]
  }

  join: view_01295 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01291.category} = ${view_01295.category} ;;
  }

  access_filter: {
    field: view_01291.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01291.is_deleted} = false ;;
}
