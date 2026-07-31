# Update for 2000 file diff target
# Explore: explore_1230
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03691.view.lkml"
include: "/views/domain_43/view_03693.view.lkml"
include: "/views/domain_44/view_03694.view.lkml"
include: "/views/domain_45/view_03695.view.lkml"

explore: explore_1230 {
  label: "Explore Explore 1230"
  description: "Comprehensive analytics explore joining base view_03691 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03691
  
  always_filter: {
    filters: [view_03691.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03691.created_at_date: "7 days"]
    unless: [view_03691.id, view_03691.status]
  }

  join: view_03693 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03691.user_id} = ${view_03693.id} ;;
    required_joins: []
  }

  join: view_03694 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03691.account_id} = ${view_03694.account_id} ;;
    required_joins: [view_03693]
  }

  join: view_03695 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03691.category} = ${view_03695.category} ;;
  }

  access_filter: {
    field: view_03691.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03691.is_deleted} = false ;;
}
