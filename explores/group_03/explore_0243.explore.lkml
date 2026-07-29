# Explore: explore_0243
# Auto-generated LookML Explore File

include: "/views/domain_30/view_00730.view.lkml"
include: "/views/domain_32/view_00732.view.lkml"
include: "/views/domain_33/view_00733.view.lkml"
include: "/views/domain_34/view_00734.view.lkml"

explore: explore_0243 {
  label: "Explore Explore 0243"
  description: "Comprehensive analytics explore joining base view_00730 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00730
  
  always_filter: {
    filters: [view_00730.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00730.created_at_date: "7 days"]
    unless: [view_00730.id, view_00730.status]
  }

  join: view_00732 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00730.user_id} = ${view_00732.id} ;;
    required_joins: []
  }

  join: view_00733 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00730.account_id} = ${view_00733.account_id} ;;
    required_joins: [view_00732]
  }

  join: view_00734 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00730.category} = ${view_00734.category} ;;
  }

  access_filter: {
    field: view_00730.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00730.is_deleted} = false ;;
}
