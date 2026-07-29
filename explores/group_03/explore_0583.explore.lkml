# Explore: explore_0583
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01750.view.lkml"
include: "/views/domain_02/view_01752.view.lkml"
include: "/views/domain_03/view_01753.view.lkml"
include: "/views/domain_04/view_01754.view.lkml"

explore: explore_0583 {
  label: "Explore Explore 0583"
  description: "Comprehensive analytics explore joining base view_01750 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01750
  
  always_filter: {
    filters: [view_01750.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01750.created_at_date: "7 days"]
    unless: [view_01750.id, view_01750.status]
  }

  join: view_01752 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01750.user_id} = ${view_01752.id} ;;
    required_joins: []
  }

  join: view_01753 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01750.account_id} = ${view_01753.account_id} ;;
    required_joins: [view_01752]
  }

  join: view_01754 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01750.category} = ${view_01754.category} ;;
  }

  access_filter: {
    field: view_01750.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01750.is_deleted} = false ;;
}
