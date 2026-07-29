# Explore: explore_0916
# Auto-generated LookML Explore File

include: "/views/domain_49/view_02749.view.lkml"
include: "/views/domain_01/view_02751.view.lkml"
include: "/views/domain_02/view_02752.view.lkml"
include: "/views/domain_03/view_02753.view.lkml"

explore: explore_0916 {
  label: "Explore Explore 0916"
  description: "Comprehensive analytics explore joining base view_02749 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02749
  
  always_filter: {
    filters: [view_02749.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02749.created_at_date: "7 days"]
    unless: [view_02749.id, view_02749.status]
  }

  join: view_02751 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02749.user_id} = ${view_02751.id} ;;
    required_joins: []
  }

  join: view_02752 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02749.account_id} = ${view_02752.account_id} ;;
    required_joins: [view_02751]
  }

  join: view_02753 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02749.category} = ${view_02753.category} ;;
  }

  access_filter: {
    field: view_02749.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02749.is_deleted} = false ;;
}
