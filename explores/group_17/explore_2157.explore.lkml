# Explore: explore_2157
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06472.view.lkml"
include: "/views/domain_24/view_06474.view.lkml"
include: "/views/domain_25/view_06475.view.lkml"
include: "/views/domain_26/view_06476.view.lkml"

explore: explore_2157 {
  label: "Explore Explore 2157"
  description: "Comprehensive analytics explore joining base view_06472 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06472
  
  always_filter: {
    filters: [view_06472.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06472.created_at_date: "7 days"]
    unless: [view_06472.id, view_06472.status]
  }

  join: view_06474 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06472.user_id} = ${view_06474.id} ;;
    required_joins: []
  }

  join: view_06475 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06472.account_id} = ${view_06475.account_id} ;;
    required_joins: [view_06474]
  }

  join: view_06476 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06472.category} = ${view_06476.category} ;;
  }

  access_filter: {
    field: view_06472.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06472.is_deleted} = false ;;
}
