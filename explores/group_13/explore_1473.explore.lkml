# Explore: explore_1473
# Auto-generated LookML Explore File

include: "/views/domain_20/view_04420.view.lkml"
include: "/views/domain_22/view_04422.view.lkml"
include: "/views/domain_23/view_04423.view.lkml"
include: "/views/domain_24/view_04424.view.lkml"

explore: explore_1473 {
  label: "Explore Explore 1473"
  description: "Comprehensive analytics explore joining base view_04420 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04420
  
  always_filter: {
    filters: [view_04420.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04420.created_at_date: "7 days"]
    unless: [view_04420.id, view_04420.status]
  }

  join: view_04422 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04420.user_id} = ${view_04422.id} ;;
    required_joins: []
  }

  join: view_04423 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04420.account_id} = ${view_04423.account_id} ;;
    required_joins: [view_04422]
  }

  join: view_04424 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04420.category} = ${view_04424.category} ;;
  }

  access_filter: {
    field: view_04420.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04420.is_deleted} = false ;;
}
