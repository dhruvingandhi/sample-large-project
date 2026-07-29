# Explore: explore_0807
# Auto-generated LookML Explore File

include: "/views/domain_22/view_02422.view.lkml"
include: "/views/domain_24/view_02424.view.lkml"
include: "/views/domain_25/view_02425.view.lkml"
include: "/views/domain_26/view_02426.view.lkml"

explore: explore_0807 {
  label: "Explore Explore 0807"
  description: "Comprehensive analytics explore joining base view_02422 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02422
  
  always_filter: {
    filters: [view_02422.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02422.created_at_date: "7 days"]
    unless: [view_02422.id, view_02422.status]
  }

  join: view_02424 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02422.user_id} = ${view_02424.id} ;;
    required_joins: []
  }

  join: view_02425 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02422.account_id} = ${view_02425.account_id} ;;
    required_joins: [view_02424]
  }

  join: view_02426 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02422.category} = ${view_02426.category} ;;
  }

  access_filter: {
    field: view_02422.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02422.is_deleted} = false ;;
}
