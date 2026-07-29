# Explore: explore_1474
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04423.view.lkml"
include: "/views/domain_25/view_04425.view.lkml"
include: "/views/domain_26/view_04426.view.lkml"
include: "/views/domain_27/view_04427.view.lkml"

explore: explore_1474 {
  label: "Explore Explore 1474"
  description: "Comprehensive analytics explore joining base view_04423 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04423
  
  always_filter: {
    filters: [view_04423.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04423.created_at_date: "7 days"]
    unless: [view_04423.id, view_04423.status]
  }

  join: view_04425 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04423.user_id} = ${view_04425.id} ;;
    required_joins: []
  }

  join: view_04426 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04423.account_id} = ${view_04426.account_id} ;;
    required_joins: [view_04425]
  }

  join: view_04427 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04423.category} = ${view_04427.category} ;;
  }

  access_filter: {
    field: view_04423.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04423.is_deleted} = false ;;
}
