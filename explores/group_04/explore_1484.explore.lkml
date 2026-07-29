# Explore: explore_1484
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04453.view.lkml"
include: "/views/domain_05/view_04455.view.lkml"
include: "/views/domain_06/view_04456.view.lkml"
include: "/views/domain_07/view_04457.view.lkml"

explore: explore_1484 {
  label: "Explore Explore 1484"
  description: "Comprehensive analytics explore joining base view_04453 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04453
  
  always_filter: {
    filters: [view_04453.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04453.created_at_date: "7 days"]
    unless: [view_04453.id, view_04453.status]
  }

  join: view_04455 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04453.user_id} = ${view_04455.id} ;;
    required_joins: []
  }

  join: view_04456 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04453.account_id} = ${view_04456.account_id} ;;
    required_joins: [view_04455]
  }

  join: view_04457 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04453.category} = ${view_04457.category} ;;
  }

  access_filter: {
    field: view_04453.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04453.is_deleted} = false ;;
}
