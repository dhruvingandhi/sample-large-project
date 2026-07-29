# Explore: explore_1257
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03772.view.lkml"
include: "/views/domain_24/view_03774.view.lkml"
include: "/views/domain_25/view_03775.view.lkml"
include: "/views/domain_26/view_03776.view.lkml"

explore: explore_1257 {
  label: "Explore Explore 1257"
  description: "Comprehensive analytics explore joining base view_03772 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03772
  
  always_filter: {
    filters: [view_03772.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03772.created_at_date: "7 days"]
    unless: [view_03772.id, view_03772.status]
  }

  join: view_03774 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03772.user_id} = ${view_03774.id} ;;
    required_joins: []
  }

  join: view_03775 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03772.account_id} = ${view_03775.account_id} ;;
    required_joins: [view_03774]
  }

  join: view_03776 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03772.category} = ${view_03776.category} ;;
  }

  access_filter: {
    field: view_03772.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03772.is_deleted} = false ;;
}
