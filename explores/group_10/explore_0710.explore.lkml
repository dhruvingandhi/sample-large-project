# Update for 2000 file diff target
# Explore: explore_0710
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02131.view.lkml"
include: "/views/domain_33/view_02133.view.lkml"
include: "/views/domain_34/view_02134.view.lkml"
include: "/views/domain_35/view_02135.view.lkml"

explore: explore_0710 {
  label: "Explore Explore 0710"
  description: "Comprehensive analytics explore joining base view_02131 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02131
  
  always_filter: {
    filters: [view_02131.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02131.created_at_date: "7 days"]
    unless: [view_02131.id, view_02131.status]
  }

  join: view_02133 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02131.user_id} = ${view_02133.id} ;;
    required_joins: []
  }

  join: view_02134 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02131.account_id} = ${view_02134.account_id} ;;
    required_joins: [view_02133]
  }

  join: view_02135 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02131.category} = ${view_02135.category} ;;
  }

  access_filter: {
    field: view_02131.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02131.is_deleted} = false ;;
}
