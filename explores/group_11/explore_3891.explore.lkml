# Explore: explore_3891
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11674.view.lkml"
include: "/views/domain_26/view_11676.view.lkml"
include: "/views/domain_27/view_11677.view.lkml"
include: "/views/domain_28/view_11678.view.lkml"

explore: explore_3891 {
  label: "Explore Explore 3891"
  description: "Comprehensive analytics explore joining base view_11674 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11674
  
  always_filter: {
    filters: [view_11674.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11674.created_at_date: "7 days"]
    unless: [view_11674.id, view_11674.status]
  }

  join: view_11676 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11674.user_id} = ${view_11676.id} ;;
    required_joins: []
  }

  join: view_11677 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11674.account_id} = ${view_11677.account_id} ;;
    required_joins: [view_11676]
  }

  join: view_11678 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11674.category} = ${view_11678.category} ;;
  }

  access_filter: {
    field: view_11674.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11674.is_deleted} = false ;;
}
