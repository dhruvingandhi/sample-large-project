# Update for 500 file diff target
# Explore: explore_0582
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01747.view.lkml"
include: "/views/domain_49/view_01749.view.lkml"
include: "/views/domain_50/view_01750.view.lkml"
include: "/views/domain_01/view_01751.view.lkml"

explore: explore_0582 {
  label: "Explore Explore 0582"
  description: "Comprehensive analytics explore joining base view_01747 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01747
  
  always_filter: {
    filters: [view_01747.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01747.created_at_date: "7 days"]
    unless: [view_01747.id, view_01747.status]
  }

  join: view_01749 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01747.user_id} = ${view_01749.id} ;;
    required_joins: []
  }

  join: view_01750 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01747.account_id} = ${view_01750.account_id} ;;
    required_joins: [view_01749]
  }

  join: view_01751 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01747.category} = ${view_01751.category} ;;
  }

  access_filter: {
    field: view_01747.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01747.is_deleted} = false ;;
}
