# Explore: explore_3209
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09628.view.lkml"
include: "/views/domain_30/view_09630.view.lkml"
include: "/views/domain_31/view_09631.view.lkml"
include: "/views/domain_32/view_09632.view.lkml"

explore: explore_3209 {
  label: "Explore Explore 3209"
  description: "Comprehensive analytics explore joining base view_09628 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09628
  
  always_filter: {
    filters: [view_09628.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09628.created_at_date: "7 days"]
    unless: [view_09628.id, view_09628.status]
  }

  join: view_09630 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09628.user_id} = ${view_09630.id} ;;
    required_joins: []
  }

  join: view_09631 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09628.account_id} = ${view_09631.account_id} ;;
    required_joins: [view_09630]
  }

  join: view_09632 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09628.category} = ${view_09632.category} ;;
  }

  access_filter: {
    field: view_09628.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09628.is_deleted} = false ;;
}
