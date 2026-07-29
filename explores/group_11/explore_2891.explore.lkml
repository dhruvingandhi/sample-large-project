# Explore: explore_2891
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08674.view.lkml"
include: "/views/domain_26/view_08676.view.lkml"
include: "/views/domain_27/view_08677.view.lkml"
include: "/views/domain_28/view_08678.view.lkml"

explore: explore_2891 {
  label: "Explore Explore 2891"
  description: "Comprehensive analytics explore joining base view_08674 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08674
  
  always_filter: {
    filters: [view_08674.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08674.created_at_date: "7 days"]
    unless: [view_08674.id, view_08674.status]
  }

  join: view_08676 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08674.user_id} = ${view_08676.id} ;;
    required_joins: []
  }

  join: view_08677 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08674.account_id} = ${view_08677.account_id} ;;
    required_joins: [view_08676]
  }

  join: view_08678 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08674.category} = ${view_08678.category} ;;
  }

  access_filter: {
    field: view_08674.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08674.is_deleted} = false ;;
}
