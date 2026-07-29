# Explore: explore_0891
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02674.view.lkml"
include: "/views/domain_26/view_02676.view.lkml"
include: "/views/domain_27/view_02677.view.lkml"
include: "/views/domain_28/view_02678.view.lkml"

explore: explore_0891 {
  label: "Explore Explore 0891"
  description: "Comprehensive analytics explore joining base view_02674 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02674
  
  always_filter: {
    filters: [view_02674.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02674.created_at_date: "7 days"]
    unless: [view_02674.id, view_02674.status]
  }

  join: view_02676 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02674.user_id} = ${view_02676.id} ;;
    required_joins: []
  }

  join: view_02677 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02674.account_id} = ${view_02677.account_id} ;;
    required_joins: [view_02676]
  }

  join: view_02678 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02674.category} = ${view_02678.category} ;;
  }

  access_filter: {
    field: view_02674.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02674.is_deleted} = false ;;
}
