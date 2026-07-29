# Explore: explore_3323
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09970.view.lkml"
include: "/views/domain_22/view_09972.view.lkml"
include: "/views/domain_23/view_09973.view.lkml"
include: "/views/domain_24/view_09974.view.lkml"

explore: explore_3323 {
  label: "Explore Explore 3323"
  description: "Comprehensive analytics explore joining base view_09970 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09970
  
  always_filter: {
    filters: [view_09970.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09970.created_at_date: "7 days"]
    unless: [view_09970.id, view_09970.status]
  }

  join: view_09972 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09970.user_id} = ${view_09972.id} ;;
    required_joins: []
  }

  join: view_09973 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09970.account_id} = ${view_09973.account_id} ;;
    required_joins: [view_09972]
  }

  join: view_09974 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09970.category} = ${view_09974.category} ;;
  }

  access_filter: {
    field: view_09970.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09970.is_deleted} = false ;;
}
