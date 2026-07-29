# Explore: explore_3533
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10600.view.lkml"
include: "/views/domain_02/view_10602.view.lkml"
include: "/views/domain_03/view_10603.view.lkml"
include: "/views/domain_04/view_10604.view.lkml"

explore: explore_3533 {
  label: "Explore Explore 3533"
  description: "Comprehensive analytics explore joining base view_10600 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10600
  
  always_filter: {
    filters: [view_10600.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10600.created_at_date: "7 days"]
    unless: [view_10600.id, view_10600.status]
  }

  join: view_10602 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10600.user_id} = ${view_10602.id} ;;
    required_joins: []
  }

  join: view_10603 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10600.account_id} = ${view_10603.account_id} ;;
    required_joins: [view_10602]
  }

  join: view_10604 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10600.category} = ${view_10604.category} ;;
  }

  access_filter: {
    field: view_10600.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10600.is_deleted} = false ;;
}
