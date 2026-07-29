# Explore: explore_2614
# Auto-generated LookML Explore File

include: "/views/domain_43/view_07843.view.lkml"
include: "/views/domain_45/view_07845.view.lkml"
include: "/views/domain_46/view_07846.view.lkml"
include: "/views/domain_47/view_07847.view.lkml"

explore: explore_2614 {
  label: "Explore Explore 2614"
  description: "Comprehensive analytics explore joining base view_07843 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07843
  
  always_filter: {
    filters: [view_07843.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07843.created_at_date: "7 days"]
    unless: [view_07843.id, view_07843.status]
  }

  join: view_07845 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07843.user_id} = ${view_07845.id} ;;
    required_joins: []
  }

  join: view_07846 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07843.account_id} = ${view_07846.account_id} ;;
    required_joins: [view_07845]
  }

  join: view_07847 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07843.category} = ${view_07847.category} ;;
  }

  access_filter: {
    field: view_07843.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07843.is_deleted} = false ;;
}
