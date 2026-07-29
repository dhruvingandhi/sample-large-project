# Explore: explore_1890
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05671.view.lkml"
include: "/views/domain_23/view_05673.view.lkml"
include: "/views/domain_24/view_05674.view.lkml"
include: "/views/domain_25/view_05675.view.lkml"

explore: explore_1890 {
  label: "Explore Explore 1890"
  description: "Comprehensive analytics explore joining base view_05671 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05671
  
  always_filter: {
    filters: [view_05671.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05671.created_at_date: "7 days"]
    unless: [view_05671.id, view_05671.status]
  }

  join: view_05673 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05671.user_id} = ${view_05673.id} ;;
    required_joins: []
  }

  join: view_05674 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05671.account_id} = ${view_05674.account_id} ;;
    required_joins: [view_05673]
  }

  join: view_05675 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05671.category} = ${view_05675.category} ;;
  }

  access_filter: {
    field: view_05671.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05671.is_deleted} = false ;;
}
