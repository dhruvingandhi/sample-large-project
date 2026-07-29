# Explore: explore_0230
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00691.view.lkml"
include: "/views/domain_43/view_00693.view.lkml"
include: "/views/domain_44/view_00694.view.lkml"
include: "/views/domain_45/view_00695.view.lkml"

explore: explore_0230 {
  label: "Explore Explore 0230"
  description: "Comprehensive analytics explore joining base view_00691 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00691
  
  always_filter: {
    filters: [view_00691.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00691.created_at_date: "7 days"]
    unless: [view_00691.id, view_00691.status]
  }

  join: view_00693 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00691.user_id} = ${view_00693.id} ;;
    required_joins: []
  }

  join: view_00694 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00691.account_id} = ${view_00694.account_id} ;;
    required_joins: [view_00693]
  }

  join: view_00695 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00691.category} = ${view_00695.category} ;;
  }

  access_filter: {
    field: view_00691.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00691.is_deleted} = false ;;
}
