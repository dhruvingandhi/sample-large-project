# Explore: explore_1225
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03676.view.lkml"
include: "/views/domain_28/view_03678.view.lkml"
include: "/views/domain_29/view_03679.view.lkml"
include: "/views/domain_30/view_03680.view.lkml"

explore: explore_1225 {
  label: "Explore Explore 1225"
  description: "Comprehensive analytics explore joining base view_03676 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03676
  
  always_filter: {
    filters: [view_03676.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03676.created_at_date: "7 days"]
    unless: [view_03676.id, view_03676.status]
  }

  join: view_03678 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03676.user_id} = ${view_03678.id} ;;
    required_joins: []
  }

  join: view_03679 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03676.account_id} = ${view_03679.account_id} ;;
    required_joins: [view_03678]
  }

  join: view_03680 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03676.category} = ${view_03680.category} ;;
  }

  access_filter: {
    field: view_03676.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03676.is_deleted} = false ;;
}
