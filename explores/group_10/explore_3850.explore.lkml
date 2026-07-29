# Explore: explore_3850
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11551.view.lkml"
include: "/views/domain_03/view_11553.view.lkml"
include: "/views/domain_04/view_11554.view.lkml"
include: "/views/domain_05/view_11555.view.lkml"

explore: explore_3850 {
  label: "Explore Explore 3850"
  description: "Comprehensive analytics explore joining base view_11551 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11551
  
  always_filter: {
    filters: [view_11551.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11551.created_at_date: "7 days"]
    unless: [view_11551.id, view_11551.status]
  }

  join: view_11553 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11551.user_id} = ${view_11553.id} ;;
    required_joins: []
  }

  join: view_11554 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11551.account_id} = ${view_11554.account_id} ;;
    required_joins: [view_11553]
  }

  join: view_11555 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11551.category} = ${view_11555.category} ;;
  }

  access_filter: {
    field: view_11551.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11551.is_deleted} = false ;;
}
