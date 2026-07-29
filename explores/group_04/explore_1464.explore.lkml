# Explore: explore_1464
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04393.view.lkml"
include: "/views/domain_45/view_04395.view.lkml"
include: "/views/domain_46/view_04396.view.lkml"
include: "/views/domain_47/view_04397.view.lkml"

explore: explore_1464 {
  label: "Explore Explore 1464"
  description: "Comprehensive analytics explore joining base view_04393 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04393
  
  always_filter: {
    filters: [view_04393.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04393.created_at_date: "7 days"]
    unless: [view_04393.id, view_04393.status]
  }

  join: view_04395 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04393.user_id} = ${view_04395.id} ;;
    required_joins: []
  }

  join: view_04396 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04393.account_id} = ${view_04396.account_id} ;;
    required_joins: [view_04395]
  }

  join: view_04397 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04393.category} = ${view_04397.category} ;;
  }

  access_filter: {
    field: view_04393.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04393.is_deleted} = false ;;
}
