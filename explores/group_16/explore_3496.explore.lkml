# Explore: explore_3496
# Auto-generated LookML Explore File

include: "/views/domain_39/view_10489.view.lkml"
include: "/views/domain_41/view_10491.view.lkml"
include: "/views/domain_42/view_10492.view.lkml"
include: "/views/domain_43/view_10493.view.lkml"

explore: explore_3496 {
  label: "Explore Explore 3496"
  description: "Comprehensive analytics explore joining base view_10489 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10489
  
  always_filter: {
    filters: [view_10489.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10489.created_at_date: "7 days"]
    unless: [view_10489.id, view_10489.status]
  }

  join: view_10491 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10489.user_id} = ${view_10491.id} ;;
    required_joins: []
  }

  join: view_10492 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10489.account_id} = ${view_10492.account_id} ;;
    required_joins: [view_10491]
  }

  join: view_10493 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10489.category} = ${view_10493.category} ;;
  }

  access_filter: {
    field: view_10489.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10489.is_deleted} = false ;;
}
