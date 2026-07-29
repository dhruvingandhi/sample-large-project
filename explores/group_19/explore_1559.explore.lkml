# Explore: explore_1559
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04678.view.lkml"
include: "/views/domain_30/view_04680.view.lkml"
include: "/views/domain_31/view_04681.view.lkml"
include: "/views/domain_32/view_04682.view.lkml"

explore: explore_1559 {
  label: "Explore Explore 1559"
  description: "Comprehensive analytics explore joining base view_04678 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04678
  
  always_filter: {
    filters: [view_04678.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04678.created_at_date: "7 days"]
    unless: [view_04678.id, view_04678.status]
  }

  join: view_04680 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04678.user_id} = ${view_04680.id} ;;
    required_joins: []
  }

  join: view_04681 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04678.account_id} = ${view_04681.account_id} ;;
    required_joins: [view_04680]
  }

  join: view_04682 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04678.category} = ${view_04682.category} ;;
  }

  access_filter: {
    field: view_04678.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04678.is_deleted} = false ;;
}
