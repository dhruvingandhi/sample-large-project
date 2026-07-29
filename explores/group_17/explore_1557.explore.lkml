# Explore: explore_1557
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04672.view.lkml"
include: "/views/domain_24/view_04674.view.lkml"
include: "/views/domain_25/view_04675.view.lkml"
include: "/views/domain_26/view_04676.view.lkml"

explore: explore_1557 {
  label: "Explore Explore 1557"
  description: "Comprehensive analytics explore joining base view_04672 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04672
  
  always_filter: {
    filters: [view_04672.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04672.created_at_date: "7 days"]
    unless: [view_04672.id, view_04672.status]
  }

  join: view_04674 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04672.user_id} = ${view_04674.id} ;;
    required_joins: []
  }

  join: view_04675 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04672.account_id} = ${view_04675.account_id} ;;
    required_joins: [view_04674]
  }

  join: view_04676 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04672.category} = ${view_04676.category} ;;
  }

  access_filter: {
    field: view_04672.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04672.is_deleted} = false ;;
}
