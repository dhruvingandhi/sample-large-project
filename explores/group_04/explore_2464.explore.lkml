# Explore: explore_2464
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07393.view.lkml"
include: "/views/domain_45/view_07395.view.lkml"
include: "/views/domain_46/view_07396.view.lkml"
include: "/views/domain_47/view_07397.view.lkml"

explore: explore_2464 {
  label: "Explore Explore 2464"
  description: "Comprehensive analytics explore joining base view_07393 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07393
  
  always_filter: {
    filters: [view_07393.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07393.created_at_date: "7 days"]
    unless: [view_07393.id, view_07393.status]
  }

  join: view_07395 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07393.user_id} = ${view_07395.id} ;;
    required_joins: []
  }

  join: view_07396 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07393.account_id} = ${view_07396.account_id} ;;
    required_joins: [view_07395]
  }

  join: view_07397 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07393.category} = ${view_07397.category} ;;
  }

  access_filter: {
    field: view_07393.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07393.is_deleted} = false ;;
}
