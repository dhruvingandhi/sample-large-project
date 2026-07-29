# Explore: explore_3952
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11857.view.lkml"
include: "/views/domain_09/view_11859.view.lkml"
include: "/views/domain_10/view_11860.view.lkml"
include: "/views/domain_11/view_11861.view.lkml"

explore: explore_3952 {
  label: "Explore Explore 3952"
  description: "Comprehensive analytics explore joining base view_11857 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11857
  
  always_filter: {
    filters: [view_11857.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11857.created_at_date: "7 days"]
    unless: [view_11857.id, view_11857.status]
  }

  join: view_11859 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11857.user_id} = ${view_11859.id} ;;
    required_joins: []
  }

  join: view_11860 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11857.account_id} = ${view_11860.account_id} ;;
    required_joins: [view_11859]
  }

  join: view_11861 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11857.category} = ${view_11861.category} ;;
  }

  access_filter: {
    field: view_11857.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11857.is_deleted} = false ;;
}
