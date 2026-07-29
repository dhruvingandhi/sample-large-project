# Explore: explore_1591
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04774.view.lkml"
include: "/views/domain_26/view_04776.view.lkml"
include: "/views/domain_27/view_04777.view.lkml"
include: "/views/domain_28/view_04778.view.lkml"

explore: explore_1591 {
  label: "Explore Explore 1591"
  description: "Comprehensive analytics explore joining base view_04774 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04774
  
  always_filter: {
    filters: [view_04774.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04774.created_at_date: "7 days"]
    unless: [view_04774.id, view_04774.status]
  }

  join: view_04776 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04774.user_id} = ${view_04776.id} ;;
    required_joins: []
  }

  join: view_04777 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04774.account_id} = ${view_04777.account_id} ;;
    required_joins: [view_04776]
  }

  join: view_04778 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04774.category} = ${view_04778.category} ;;
  }

  access_filter: {
    field: view_04774.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04774.is_deleted} = false ;;
}
