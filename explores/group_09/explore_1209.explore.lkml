# Explore: explore_1209
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03628.view.lkml"
include: "/views/domain_30/view_03630.view.lkml"
include: "/views/domain_31/view_03631.view.lkml"
include: "/views/domain_32/view_03632.view.lkml"

explore: explore_1209 {
  label: "Explore Explore 1209"
  description: "Comprehensive analytics explore joining base view_03628 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03628
  
  always_filter: {
    filters: [view_03628.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03628.created_at_date: "7 days"]
    unless: [view_03628.id, view_03628.status]
  }

  join: view_03630 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03628.user_id} = ${view_03630.id} ;;
    required_joins: []
  }

  join: view_03631 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03628.account_id} = ${view_03631.account_id} ;;
    required_joins: [view_03630]
  }

  join: view_03632 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03628.category} = ${view_03632.category} ;;
  }

  access_filter: {
    field: view_03628.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03628.is_deleted} = false ;;
}
