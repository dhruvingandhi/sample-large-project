# Explore: explore_1014
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03043.view.lkml"
include: "/views/domain_45/view_03045.view.lkml"
include: "/views/domain_46/view_03046.view.lkml"
include: "/views/domain_47/view_03047.view.lkml"

explore: explore_1014 {
  label: "Explore Explore 1014"
  description: "Comprehensive analytics explore joining base view_03043 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03043
  
  always_filter: {
    filters: [view_03043.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03043.created_at_date: "7 days"]
    unless: [view_03043.id, view_03043.status]
  }

  join: view_03045 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03043.user_id} = ${view_03045.id} ;;
    required_joins: []
  }

  join: view_03046 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03043.account_id} = ${view_03046.account_id} ;;
    required_joins: [view_03045]
  }

  join: view_03047 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03043.category} = ${view_03047.category} ;;
  }

  access_filter: {
    field: view_03043.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03043.is_deleted} = false ;;
}
