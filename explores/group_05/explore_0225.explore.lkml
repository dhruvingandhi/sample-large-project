# Antigravity modified: branch dg-3
# Explore: explore_0225
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00676.view.lkml"
include: "/views/domain_28/view_00678.view.lkml"
include: "/views/domain_29/view_00679.view.lkml"
include: "/views/domain_30/view_00680.view.lkml"

explore: explore_0225 {
  label: "Explore Explore 0225"
  description: "Comprehensive analytics explore joining base view_00676 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00676
  
  always_filter: {
    filters: [view_00676.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00676.created_at_date: "7 days"]
    unless: [view_00676.id, view_00676.status]
  }

  join: view_00678 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00676.user_id} = ${view_00678.id} ;;
    required_joins: []
  }

  join: view_00679 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00676.account_id} = ${view_00679.account_id} ;;
    required_joins: [view_00678]
  }

  join: view_00680 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00676.category} = ${view_00680.category} ;;
  }

  access_filter: {
    field: view_00676.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00676.is_deleted} = false ;;
}
