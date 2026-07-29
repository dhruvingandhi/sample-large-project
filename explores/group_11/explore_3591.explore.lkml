# Explore: explore_3591
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10774.view.lkml"
include: "/views/domain_26/view_10776.view.lkml"
include: "/views/domain_27/view_10777.view.lkml"
include: "/views/domain_28/view_10778.view.lkml"

explore: explore_3591 {
  label: "Explore Explore 3591"
  description: "Comprehensive analytics explore joining base view_10774 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10774
  
  always_filter: {
    filters: [view_10774.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10774.created_at_date: "7 days"]
    unless: [view_10774.id, view_10774.status]
  }

  join: view_10776 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10774.user_id} = ${view_10776.id} ;;
    required_joins: []
  }

  join: view_10777 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10774.account_id} = ${view_10777.account_id} ;;
    required_joins: [view_10776]
  }

  join: view_10778 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10774.category} = ${view_10778.category} ;;
  }

  access_filter: {
    field: view_10774.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10774.is_deleted} = false ;;
}
