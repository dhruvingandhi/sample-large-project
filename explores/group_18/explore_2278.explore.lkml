# Explore: explore_2278
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06835.view.lkml"
include: "/views/domain_37/view_06837.view.lkml"
include: "/views/domain_38/view_06838.view.lkml"
include: "/views/domain_39/view_06839.view.lkml"

explore: explore_2278 {
  label: "Explore Explore 2278"
  description: "Comprehensive analytics explore joining base view_06835 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06835
  
  always_filter: {
    filters: [view_06835.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06835.created_at_date: "7 days"]
    unless: [view_06835.id, view_06835.status]
  }

  join: view_06837 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06835.user_id} = ${view_06837.id} ;;
    required_joins: []
  }

  join: view_06838 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06835.account_id} = ${view_06838.account_id} ;;
    required_joins: [view_06837]
  }

  join: view_06839 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06835.category} = ${view_06839.category} ;;
  }

  access_filter: {
    field: view_06835.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06835.is_deleted} = false ;;
}
