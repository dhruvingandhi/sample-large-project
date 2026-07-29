# Explore: explore_0963
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02890.view.lkml"
include: "/views/domain_42/view_02892.view.lkml"
include: "/views/domain_43/view_02893.view.lkml"
include: "/views/domain_44/view_02894.view.lkml"

explore: explore_0963 {
  label: "Explore Explore 0963"
  description: "Comprehensive analytics explore joining base view_02890 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02890
  
  always_filter: {
    filters: [view_02890.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02890.created_at_date: "7 days"]
    unless: [view_02890.id, view_02890.status]
  }

  join: view_02892 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02890.user_id} = ${view_02892.id} ;;
    required_joins: []
  }

  join: view_02893 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02890.account_id} = ${view_02893.account_id} ;;
    required_joins: [view_02892]
  }

  join: view_02894 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02890.category} = ${view_02894.category} ;;
  }

  access_filter: {
    field: view_02890.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02890.is_deleted} = false ;;
}
