# Explore: explore_0014
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00043.view.lkml"
include: "/views/domain_45/view_00045.view.lkml"
include: "/views/domain_46/view_00046.view.lkml"
include: "/views/domain_47/view_00047.view.lkml"

explore: explore_0014 {
  label: "Explore Explore 0014"
  description: "Comprehensive analytics explore joining base view_00043 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00043
  
  always_filter: {
    filters: [view_00043.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00043.created_at_date: "7 days"]
    unless: [view_00043.id, view_00043.status]
  }

  join: view_00045 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00043.user_id} = ${view_00045.id} ;;
    required_joins: []
  }

  join: view_00046 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00043.account_id} = ${view_00046.account_id} ;;
    required_joins: [view_00045]
  }

  join: view_00047 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00043.category} = ${view_00047.category} ;;
  }

  access_filter: {
    field: view_00043.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00043.is_deleted} = false ;;
}
