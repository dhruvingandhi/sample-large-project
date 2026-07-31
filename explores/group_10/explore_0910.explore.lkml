# Update for 2000 file diff target
# Explore: explore_0910
# Auto-generated LookML Explore File

include: "/views/domain_31/view_02731.view.lkml"
include: "/views/domain_33/view_02733.view.lkml"
include: "/views/domain_34/view_02734.view.lkml"
include: "/views/domain_35/view_02735.view.lkml"

explore: explore_0910 {
  label: "Explore Explore 0910"
  description: "Comprehensive analytics explore joining base view_02731 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02731
  
  always_filter: {
    filters: [view_02731.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02731.created_at_date: "7 days"]
    unless: [view_02731.id, view_02731.status]
  }

  join: view_02733 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02731.user_id} = ${view_02733.id} ;;
    required_joins: []
  }

  join: view_02734 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02731.account_id} = ${view_02734.account_id} ;;
    required_joins: [view_02733]
  }

  join: view_02735 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02731.category} = ${view_02735.category} ;;
  }

  access_filter: {
    field: view_02731.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02731.is_deleted} = false ;;
}
