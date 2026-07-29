# Explore: explore_2613
# Auto-generated LookML Explore File

include: "/views/domain_40/view_07840.view.lkml"
include: "/views/domain_42/view_07842.view.lkml"
include: "/views/domain_43/view_07843.view.lkml"
include: "/views/domain_44/view_07844.view.lkml"

explore: explore_2613 {
  label: "Explore Explore 2613"
  description: "Comprehensive analytics explore joining base view_07840 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07840
  
  always_filter: {
    filters: [view_07840.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07840.created_at_date: "7 days"]
    unless: [view_07840.id, view_07840.status]
  }

  join: view_07842 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07840.user_id} = ${view_07842.id} ;;
    required_joins: []
  }

  join: view_07843 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07840.account_id} = ${view_07843.account_id} ;;
    required_joins: [view_07842]
  }

  join: view_07844 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07840.category} = ${view_07844.category} ;;
  }

  access_filter: {
    field: view_07840.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07840.is_deleted} = false ;;
}
