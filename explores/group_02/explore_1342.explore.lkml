# Explore: explore_1342
# Auto-generated LookML Explore File

include: "/views/domain_27/view_04027.view.lkml"
include: "/views/domain_29/view_04029.view.lkml"
include: "/views/domain_30/view_04030.view.lkml"
include: "/views/domain_31/view_04031.view.lkml"

explore: explore_1342 {
  label: "Explore Explore 1342"
  description: "Comprehensive analytics explore joining base view_04027 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04027
  
  always_filter: {
    filters: [view_04027.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04027.created_at_date: "7 days"]
    unless: [view_04027.id, view_04027.status]
  }

  join: view_04029 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04027.user_id} = ${view_04029.id} ;;
    required_joins: []
  }

  join: view_04030 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04027.account_id} = ${view_04030.account_id} ;;
    required_joins: [view_04029]
  }

  join: view_04031 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04027.category} = ${view_04031.category} ;;
  }

  access_filter: {
    field: view_04027.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04027.is_deleted} = false ;;
}
