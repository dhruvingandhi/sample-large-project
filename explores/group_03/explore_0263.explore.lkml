# Explore: explore_0263
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00790.view.lkml"
include: "/views/domain_42/view_00792.view.lkml"
include: "/views/domain_43/view_00793.view.lkml"
include: "/views/domain_44/view_00794.view.lkml"

explore: explore_0263 {
  label: "Explore Explore 0263"
  description: "Comprehensive analytics explore joining base view_00790 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00790
  
  always_filter: {
    filters: [view_00790.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00790.created_at_date: "7 days"]
    unless: [view_00790.id, view_00790.status]
  }

  join: view_00792 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00790.user_id} = ${view_00792.id} ;;
    required_joins: []
  }

  join: view_00793 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00790.account_id} = ${view_00793.account_id} ;;
    required_joins: [view_00792]
  }

  join: view_00794 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00790.category} = ${view_00794.category} ;;
  }

  access_filter: {
    field: view_00790.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00790.is_deleted} = false ;;
}
