# Explore: explore_0699
# Auto-generated LookML Explore File

include: "/views/domain_48/view_02098.view.lkml"
include: "/views/domain_50/view_02100.view.lkml"
include: "/views/domain_01/view_02101.view.lkml"
include: "/views/domain_02/view_02102.view.lkml"

explore: explore_0699 {
  label: "Explore Explore 0699"
  description: "Comprehensive analytics explore joining base view_02098 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02098
  
  always_filter: {
    filters: [view_02098.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02098.created_at_date: "7 days"]
    unless: [view_02098.id, view_02098.status]
  }

  join: view_02100 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02098.user_id} = ${view_02100.id} ;;
    required_joins: []
  }

  join: view_02101 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02098.account_id} = ${view_02101.account_id} ;;
    required_joins: [view_02100]
  }

  join: view_02102 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02098.category} = ${view_02102.category} ;;
  }

  access_filter: {
    field: view_02098.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02098.is_deleted} = false ;;
}
