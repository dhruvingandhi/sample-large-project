# Explore: explore_1391
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04174.view.lkml"
include: "/views/domain_26/view_04176.view.lkml"
include: "/views/domain_27/view_04177.view.lkml"
include: "/views/domain_28/view_04178.view.lkml"

explore: explore_1391 {
  label: "Explore Explore 1391"
  description: "Comprehensive analytics explore joining base view_04174 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04174
  
  always_filter: {
    filters: [view_04174.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04174.created_at_date: "7 days"]
    unless: [view_04174.id, view_04174.status]
  }

  join: view_04176 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04174.user_id} = ${view_04176.id} ;;
    required_joins: []
  }

  join: view_04177 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04174.account_id} = ${view_04177.account_id} ;;
    required_joins: [view_04176]
  }

  join: view_04178 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04174.category} = ${view_04178.category} ;;
  }

  access_filter: {
    field: view_04174.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04174.is_deleted} = false ;;
}
