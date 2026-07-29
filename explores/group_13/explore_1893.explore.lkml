# Explore: explore_1893
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05680.view.lkml"
include: "/views/domain_32/view_05682.view.lkml"
include: "/views/domain_33/view_05683.view.lkml"
include: "/views/domain_34/view_05684.view.lkml"

explore: explore_1893 {
  label: "Explore Explore 1893"
  description: "Comprehensive analytics explore joining base view_05680 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05680
  
  always_filter: {
    filters: [view_05680.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05680.created_at_date: "7 days"]
    unless: [view_05680.id, view_05680.status]
  }

  join: view_05682 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05680.user_id} = ${view_05682.id} ;;
    required_joins: []
  }

  join: view_05683 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05680.account_id} = ${view_05683.account_id} ;;
    required_joins: [view_05682]
  }

  join: view_05684 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05680.category} = ${view_05684.category} ;;
  }

  access_filter: {
    field: view_05680.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05680.is_deleted} = false ;;
}
